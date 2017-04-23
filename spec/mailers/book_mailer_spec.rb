require "rails_helper"

RSpec.describe BookMailerMailer, type: :mailer do
  describe "new_book" do
    let(:mail) { BookMailerMailer.new_book }

    it "renders the headers" do
      expect(mail.subject).to eq("New book")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
