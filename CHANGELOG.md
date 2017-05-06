# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Changed
- Differentiate between `ref_no` (for payments) `tracking_no` (for claiming)

## [0.5.0] - 2017-04-07
### Added
- Add `Txn::STATUSES` status list for users of the client to use and refer for `bloom_net_center Txn` statuses

## [0.4.0] - 2017-04-03
### Changed
- Rename `contact_number` to `mobile` (follow center's new API)

## [0.3.1] - 2017-03-31
### Fixed
- FindTxnResponse: `txn` is nil (no longer raises exception) when the response is invalid

## [0.3.0] - 2017-03-27
### Changed
- Work with new version of BloomNet Center

## [0.2.0] - 2017-01-20
### Changed
- Update api_client_base to `~> 0.2.0`

## [0.1.0] - 2016-12-15
### Added
- Initial release
