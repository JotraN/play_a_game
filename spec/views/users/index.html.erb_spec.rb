require 'rails_helper'

RSpec.describe "users/index.html.erb", type: :view do
  it "shows a form with id field" do
    render
    expect(rendered).to have_selector("form")
    expect(rendered).to have_field("id")
  end
end
