//
// Copyright 2025 Ermis Inc.
//

public enum SignalMessage {
    case audioCallStart(userId: String)
    case audioCallMissed(userId: String)
    case audioCallEnded(userId: String, ender: String, duration: Int)
    case audioCallRejected(userId: String)
    case videoCallStart(userId: String)
    case videoCallMissed(userId: String)
    case videoCallEnded(userId: String, ender: String, duration: Int)
    case videoCallRejected(userId: String)
    case audioCallBusy(userId: String)
    case videoCallBusy(userId: String)

    case unknown(signalMessage: String)

    public init(signalMessage: String) {
        let components = signalMessage.split(separator: " ")
        guard components.count > 1 else {
            self = .unknown(signalMessage: signalMessage)
            return
        }
        guard let id = Int(components[0]) else {
            self = .unknown(signalMessage: signalMessage)
            return
        }
        let userId = String(components[1])

        switch id {
        case 1:
            self = .audioCallStart(userId: userId)
        case 2:
            self = .audioCallMissed(userId: userId)
        case 3:
            guard components.count > 3,
                  let duration = Int(components[3]) else {
                self = .unknown(signalMessage: signalMessage)
                return
            }
            let enderId = String(components[2])
            self = .audioCallEnded(userId: userId, ender: enderId, duration: duration)
        case 4:
            self = .videoCallStart(userId: userId)
        case 5:
            self = .videoCallMissed(userId: userId)
        case 6:
            guard components.count > 3,
                  let duration = Int(components[3]) else {
                self = .unknown(signalMessage: signalMessage)
                return
            }
            let enderId = String(components[2])
            self = .videoCallEnded(userId: userId, ender: enderId, duration: duration)
        case 7:
            self = .audioCallRejected(userId: userId)
        case 8:
            self = .videoCallRejected(userId: userId)
        case 9:
            self = .audioCallBusy(userId: userId)
        case 10:
            self = .videoCallBusy(userId: userId)
        default:
            self = .unknown(signalMessage: signalMessage)
        }
    }

    public var senderId: String? {
        switch self {
        case .audioCallStart(userId: let userId):
            return userId
        case .audioCallMissed(userId: let userId):
            return userId
        case .audioCallEnded(userId: let userId, ender: _, duration: _):
            return userId
        case .audioCallRejected(userId: let userId):
            return userId
        case .videoCallStart(userId: let userId):
            return userId
        case .videoCallMissed(userId: let userId):
            return userId
        case .videoCallEnded(userId: let userId, ender: _, duration: _):
            return userId
        case .videoCallRejected(userId: let userId):
            return userId
        case .audioCallBusy(let userId):
            return userId
        case .videoCallBusy(userId: let userId):
            return userId
        case .unknown:
            return nil
        }
    }

    public var enderId: String? {
        switch self {
        case .audioCallEnded(userId: _, ender: let ender, duration: _):
            return ender
        case .videoCallEnded(userId: _, ender: let ender, duration: _):
            return ender
        default:
            return nil
        }
    }

    public var endedReason: CallEndedReason? {
        switch self {
        case .audioCallEnded(_, _, let duration):
            return duration == 0 ? .cancelled : .normal
        case .videoCallEnded(_, _, let duration):
            return duration == 0 ? .cancelled : .normal
        case .audioCallMissed, .videoCallMissed:
            return .noAnswer
        case .audioCallRejected, .videoCallRejected:
            return .rejected
        case .audioCallBusy, .videoCallBusy:
            return .busy
        default:
            return nil
        }
    }

    public var isMissed: Bool {
        switch endedReason {
        case .cancelled, .noAnswer, .rejected, .busy:
            return true
        case .normal:
            return false
        case .none:
            return false
        }
    }

    public var isVideo: Bool {
        switch self {
        case .videoCallStart, .videoCallMissed, .videoCallRejected, .videoCallEnded, .videoCallBusy:
            return true
        default:
            return false
        }
    }
}

extension SignalMessage: Decodable {
    public init(from decoder: any Decoder) throws {
        let stringValue = try decoder.singleValueContainer().decode(String.self)
        self.init(signalMessage: stringValue)
    }
}

public enum CallEndedReason: String, Decodable {
    case cancelled
    case noAnswer
    case rejected
    case busy
    case normal
}
