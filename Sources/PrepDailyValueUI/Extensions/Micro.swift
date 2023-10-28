import PrepShared
import PrepDailyValue

extension Micro {
    var dailyValues: [DailyValue] {
        switch self {
        case .dietaryFiber:
            [fiber_eatRight, fiber_mayoClinic]
        default:
            []
        }
    }
}
