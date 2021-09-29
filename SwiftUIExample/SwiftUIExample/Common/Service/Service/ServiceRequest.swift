//
//  ServiceRequest.swift
//  capsl
//
//

import Foundation
import Alamofire

protocol ServiceRequest {
    func request<ResponseValue: Decodable>(service: ServicePackage, completion: @escaping (Result<ResponseValue, Error>) -> Void)
    func cancelAll()
}

final class ServiceRequestImpl: ServiceRequest {
    struct Constant {
        static let timeout: TimeInterval = 30
    }
    
    func request<ResponseValue: Decodable>(service: ServicePackage, completion: @escaping (Result<ResponseValue, Error>) -> Void) {
        var url = ""
        if let path = service.path {
            url = String(format: service.url, path)
        } else {
            url = service.url
        }
        
        request(url: url, params: service.params, header: nil, completion: completion)
    }
    
    func cancelAll() {
        let sessionManager = Alamofire.Session.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }
}

private extension ServiceRequestImpl {
    func request<ResponseValue: Decodable>(url: String, method: HTTPMethod = .get, params: [String: Any]? = nil, header: [String: String]? = nil, completion: @escaping (Result<ResponseValue, Error>) -> Void) {
        AF.request(url,
                   method: method,
                   parameters: params,
                   headers: HTTPHeaders(header ?? [:])
        ) { $0.timeoutInterval = Constant.timeout }
            .responseString { [weak self] (responseData) in
                switch responseData.result {
                case .success(let dataResponse):
                    self?.handleResponse(dataResponse, completion: completion)
                case .failure(let error):
                    self?.logError(errorMsg: "[Error] json not valid with decoded GET method [\(String(describing: ErrorValue.self))] = \(error.localizedDescription)")
                }
            }.resume()
    }
    
    func handleResponse<ResponseValue: Decodable>(_ dataResponse: String, completion: @escaping (Result<ResponseValue, Error>) -> Void) {
        if let json = dataResponse.data(using: .utf8) {
            do {
                let decodedObj = try JSONDecoder().decode(ResponseValue.self, from: json)
                completion(.success(decodedObj))
            } catch let DecodingError.dataCorrupted(context) {
                logError(errorMsg: context.debugDescription)
            } catch let DecodingError.keyNotFound(key, context) {
                logError(errorMsg: "Key '\(key)' not found: \(context.debugDescription); codingPath: \(context.codingPath)")
            } catch let DecodingError.valueNotFound(value, context) {
                logError(errorMsg: "value '\(value)' not found: \(context.debugDescription); codingPath: \(context.codingPath)")
            } catch let DecodingError.typeMismatch(type, context) {
                logError(errorMsg: "type '\(type)' mismatch: \(context.debugDescription); codingPath: \(context.codingPath)")
            } catch {
                logError(errorMsg: "error: \(error)")
            }
            return
        } else {
            logError(errorMsg: "error to decode: \(dataResponse)")
        }
    }
    
    func logError(errorMsg: String) {
        print(errorMsg)
    }
}
