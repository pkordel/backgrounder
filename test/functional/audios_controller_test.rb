require File.dirname(__FILE__) + '/../test_helper'

class AudiosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:audios)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_audio
    assert_difference('Audio.count') do
      post :create, :audio => { }
    end

    assert_redirected_to audio_path(assigns(:audio))
  end

  def test_should_show_audio
    get :show, :id => audios(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => audios(:one).id
    assert_response :success
  end

  def test_should_update_audio
    put :update, :id => audios(:one).id, :audio => { }
    assert_redirected_to audio_path(assigns(:audio))
  end

  def test_should_destroy_audio
    assert_difference('Audio.count', -1) do
      delete :destroy, :id => audios(:one).id
    end

    assert_redirected_to audios_path
  end
end
