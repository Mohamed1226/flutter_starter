enum CacheOptionsEnum {
  /// This option will
  /// - get from cache first
  /// - get from remote (in all cache cases - success or fails)
  LocalThenRemote,

  /// This option will
  /// - get from cache first
  /// - if no result from cache => get from remote
  /// - else stop (don't get remote)
  LocalOrRemote,

  /// This option will
  /// - get from remote first
  /// - if no result from remote (i.e. error) => get local result
  /// - else stop
  RemoteFirst,
}
