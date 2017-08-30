require 'test_helper'

class ChoiceQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @choice_question = choice_questions(:one)
  end

  test "should get index" do
    get choice_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_choice_question_url
    assert_response :success
  end

  test "should create choice_question" do
    assert_difference('ChoiceQuestion.count') do
      post choice_questions_url, params: { choice_question: { choice_id: @choice_question.choice_id, question_id: @choice_question.question_id } }
    end

    assert_redirected_to choice_question_url(ChoiceQuestion.last)
  end

  test "should show choice_question" do
    get choice_question_url(@choice_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_choice_question_url(@choice_question)
    assert_response :success
  end

  test "should update choice_question" do
    patch choice_question_url(@choice_question), params: { choice_question: { choice_id: @choice_question.choice_id, question_id: @choice_question.question_id } }
    assert_redirected_to choice_question_url(@choice_question)
  end

  test "should destroy choice_question" do
    assert_difference('ChoiceQuestion.count', -1) do
      delete choice_question_url(@choice_question)
    end

    assert_redirected_to choice_questions_url
  end
end
