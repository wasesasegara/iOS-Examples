import Foundation

// Assuming Result is a type alias or a concrete type
struct Result {
    let data: String
}

// Define your async functions
func exampleA() async throws -> Result {
    // Simulate a network call or some async work
    try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
    return Result(data: "Result from exampleA")
}

func exampleB() async throws -> Result {
    // Simulate a network call or some async work
    try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
    return Result(data: "Result from exampleB")
}

// Function to run both tasks concurrently and wait for the results
func fetchResultsConcurrently() async throws -> (Result, Result) {
    async let resultA = exampleA()
    async let resultB = exampleB()

    // Await both results
    let (resultAValue, resultBValue) = try await (resultA, resultB)
    return (resultAValue, resultBValue)
}

// Example usage
Task {
    do {
        let (resultA, resultB) = try await fetchResultsConcurrently()
        print("Result A: \(resultA.data)")
        print("Result B: \(resultB.data)")
    } catch {
        print("An error occurred: \(error)")
    }
}
