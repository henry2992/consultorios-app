require 'test_helper'

class CreateAppointmentSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_appointment_schedule = create_appointment_schedules(:one)
  end

  test "should get index" do
    get create_appointment_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_create_appointment_schedule_url
    assert_response :success
  end

  test "should create create_appointment_schedule" do
    assert_difference('CreateAppointmentSchedule.count') do
      post create_appointment_schedules_url, params: { create_appointment_schedule: { appointment_id: @create_appointment_schedule.appointment_id, end: @create_appointment_schedule.end, start: @create_appointment_schedule.start } }
    end

    assert_redirected_to create_appointment_schedule_url(CreateAppointmentSchedule.last)
  end

  test "should show create_appointment_schedule" do
    get create_appointment_schedule_url(@create_appointment_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_appointment_schedule_url(@create_appointment_schedule)
    assert_response :success
  end

  test "should update create_appointment_schedule" do
    patch create_appointment_schedule_url(@create_appointment_schedule), params: { create_appointment_schedule: { appointment_id: @create_appointment_schedule.appointment_id, end: @create_appointment_schedule.end, start: @create_appointment_schedule.start } }
    assert_redirected_to create_appointment_schedule_url(@create_appointment_schedule)
  end

  test "should destroy create_appointment_schedule" do
    assert_difference('CreateAppointmentSchedule.count', -1) do
      delete create_appointment_schedule_url(@create_appointment_schedule)
    end

    assert_redirected_to create_appointment_schedules_url
  end
end
