require 'test_helper'

class Docs::AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docs_appointment = docs_appointments(:one)
  end

  test "should get index" do
    get docs_appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_docs_appointment_url
    assert_response :success
  end

  test "should create docs_appointment" do
    assert_difference('Docs::Appointment.count') do
      post docs_appointments_url, params: { docs_appointment: { description: @docs_appointment.description, doctor_id: @docs_appointment.doctor_id, end: @docs_appointment.end, patient_id: @docs_appointment.patient_id, price: @docs_appointment.price, start: @docs_appointment.start } }
    end

    assert_redirected_to docs_appointment_url(Docs::Appointment.last)
  end

  test "should show docs_appointment" do
    get docs_appointment_url(@docs_appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_docs_appointment_url(@docs_appointment)
    assert_response :success
  end

  test "should update docs_appointment" do
    patch docs_appointment_url(@docs_appointment), params: { docs_appointment: { description: @docs_appointment.description, doctor_id: @docs_appointment.doctor_id, end: @docs_appointment.end, patient_id: @docs_appointment.patient_id, price: @docs_appointment.price, start: @docs_appointment.start } }
    assert_redirected_to docs_appointment_url(@docs_appointment)
  end

  test "should destroy docs_appointment" do
    assert_difference('Docs::Appointment.count', -1) do
      delete docs_appointment_url(@docs_appointment)
    end

    assert_redirected_to docs_appointments_url
  end
end
