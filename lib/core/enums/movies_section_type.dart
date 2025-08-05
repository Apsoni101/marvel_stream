enum MovieSectionType {
  carousel,
  horizontal,
  grid,
}
/// Identifies which logical movie section we are dealing with.
/// Used for retry events, mapping state, etc.
enum MovieSectionId {
  upcoming,
  trending,
  old,
  all,
}
