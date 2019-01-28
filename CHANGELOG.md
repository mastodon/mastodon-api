Changelog
=========

All notable changes to this project will be documented in this file.

## [2.0.0] - 2019-01-29
### Added

- Add `Mastodon::REST::Client#scheduled_statuses`
- Add `Mastodon::REST::Client#scheduled_status`
- Add `Mastodon::REST::Client#update_scheduled_status`
- Add `Mastodon::REST::Client#delete_scheduled_status`
- Add `Mastodon::REST::Client#create_report`
- Add `Mastodon::REST::Client#mutes`
- Add `Mastodon::REST::Client#blocks`
- Add `Mastodon::REST::Client#mute_status`
- Add `Mastodon::REST::Client#unmute_status`
- Add `Mastodon::REST::Client#follow_requests`
- Add `Mastodon::REST::Client#authorize_follow_request`
- Add `Mastodon::REST::Client#reject_follow_request`
- Add `Mastodon::REST::Client#dismiss_notification`
- Add `Mastodon::REST::Client#clear_notifications`
- Add `Mastodon::REST::Client#lists`
- Add `Mastodon::REST::Client#list`
- Add `Mastodon::REST::Client#create_list`
- Add `Mastodon::REST::Client#update_list`
- Add `Mastodon::REST::Client#delete_list`
- Add `Mastodon::REST::Client#list_accounts`
- Add `Mastodon::REST::Client#add_accounts_to_list`
- Add `Mastodon::REST::Client#remove_accounts_from_list`
- Add `Mastodon::REST::Client#activity`
- Add `Mastodon::REST::Client#peers`
- Add `Mastodon::REST::Client#filters`
- Add `Mastodon::REST::Client#filter`
- Add `Mastodon::REST::Client#create_filter`
- Add `Mastodon::REST::Client#update_filter`
- Add `Mastodon::REST::Client#delete_filter`
- Add `Mastodon::REST::Client#endorsements`
- Add `Mastodon::REST::Client#endorse`
- Add `Mastodon::REST::Client#unendorse`
- Add `Mastodon::REST::Client#domain_blocks`
- Add `Mastodon::REST::Client#block_domain`
- Add `Mastodon::REST::Client#unblock_domain`
- Add `Mastodon::REST::Client#custom_emojis`
- Add `Mastodon::REST::Client#conversations`
- Add `Mastodon::REST::Client#mark_conversation_as_read`
- Add `Mastodon::REST::Client#delete_conversation`
- Add `Mastodon::REST::Client#verify_app_credentials`
- Add `Mastodon::REST::Client#create_account`
- Add `Mastodon::REST::Client#search_accounts`
- Add `Mastodon::REST::Client#pin`
- Add `Mastodon::REST::Client#unpin`
- Add `Mastodon::REST::Client#delete_suggestion`
- Add `Mastodon::REST::Client#list_timeline`
- Add `card` to `Mastodon::Status`
- Add `bot?`, `emojis`, `fields` to `Mastodon::Account`
- Add `visible_in_picker` to `Mastodon::Emoji`
- Add `stats`, `languages`, `contact_account` to `Mastodon::Instance`
- Add `showing_reblogs?`, `endorsed?` to `Mastodon::Relationship`
- Add `Mastodon::Streaming::Client#direct`
- Add support for `conversation` and `filters_changed` events in streams

### Changed

- Change method signature of `Mastodon::REST::Client#create_status`
- Change method signature of `Mastodon::REST::Client#upload_media`
- Change method signature of `Mastodon::REST::Client#update_media`
- Change type of `:avatar` and `:header` params in `Mastodon::REST::Client#update_credentials`
- Rename `Mastodon::Streaming::DeletedStatus` to `Mastodon::Streaming::Events::StatusDelete`
- Change `Mastodon::REST::Client#search` to use the v2 version of the API
- Change `Mastodon::Results#hashtags` to be a collection of `Mastodon::Hashtag`
- Rename `Mastodon::Streaming::Client#firehose` to `Mastodon::Streaming::Client#public`

### Removed

- Remove `Mastodon::REST::Client#follow_by_uri`
