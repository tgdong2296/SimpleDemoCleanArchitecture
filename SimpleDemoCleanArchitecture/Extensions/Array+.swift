extension Array {
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
