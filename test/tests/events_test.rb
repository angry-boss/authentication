require 'authentication/session'
require 'securerandom'
class EventsTest < Minitest::Test

  def test_callbacks_are_executed
    session_via_callback = false
    callback = Authentication.config.events.on(:start_session) { |s| session_via_callback = s }
    begin
      controller = FakeController.new
      session = Authentication::Session.start(controller)
      assert_equal session, session_via_callback
    ensure
      Authentication.config.events.remove(:start_session, callback)
    end
  end

end
