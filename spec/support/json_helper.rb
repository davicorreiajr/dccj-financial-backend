# frozen_string_literal: true

module JsonHelper
  def expect_json_and_status(status_code)
    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(status_code)
  end
end
