module JsonHelper
  def expect_json_and_status(status_code)
    expect(response.code).to eq(status_code.to_s)
    expect(response.content_type).to eq(Mime[:json])
  end
end
