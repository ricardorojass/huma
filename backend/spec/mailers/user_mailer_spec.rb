require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "confirmation_email" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.confirmation_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirma tu cuenta!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["admin@huma.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hola")
    end
  end

  describe '#reset_password' do
    let(:user) { create(:user, :reset_password) }
    let(:mail) { UserMailer.reset_password(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Cambia tu password')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['admin@huma.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(
        'Usa el link de abajo para cambiar tu password'
      )
    end
  end
end
