require 'rails_helper'

RSpec.describe 'Modal', type: :system do
  describe 'モーダル表示機能' do
    let!(:user) { create(:user) }
    let!(:preset) { create(:preset, user: user) }
    let!(:inventory_list) { create(:inventory_list, user: user) }
    let!(:purchase_list) { create(:purchase_list, user: user) }
    let!(:schedule) { create(:schedule, user: user) }
    before { login(user) }
    context 'モーダルの表示' do
      it '初めてページを開いたときに正しくモーダルが表示される' do
        visit preset_path(preset)
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).to have_css '#modal3'
        find('#modal3').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        
        visit inventory_list_path(inventory_list)
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal3').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal4').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).to have_css '#modal5'
        find('#modal5').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'

        visit purchase_list_path(purchase_list)
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'

        visit schedule_path(schedule)
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).to have_css '#modal3'
        find('#modal3').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
      end
      it '一度モーダルが開かれた後にページに開いた際にモーダルが表示されない' do
        visit preset_path(preset)
        modal_reset
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'

        visit inventory_list_path(inventory_list)
        modal_reset
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'

        visit purchase_list_path(purchase_list)
        modal_reset
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'

        visit schedule_path(schedule)
        modal_reset
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
      end
      it '?ボタンをクリックした時にモーダルが再表示される' do
        visit preset_path(preset)
        modal_reset
        find('.modal_redisplay').click
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).to have_css '#modal3'
        find('#modal3').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'

        visit inventory_list_path(inventory_list)
        modal_reset
        find('.modal_redisplay').click
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal3').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).to have_css '#modal4'
        expect(page).not_to have_css '#modal5'
        find('#modal4').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).to have_css '#modal5'
        find('#modal5').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        expect(page).not_to have_css '#modal4'
        expect(page).not_to have_css '#modal5'

        visit purchase_list_path(purchase_list)
        modal_reset
        find('.modal_redisplay').click
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'

        visit schedule_path(schedule)
        modal_reset
        find('.modal_redisplay').click
        expect(page).to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal1').click
        expect(page).not_to have_css '#modal1'
        expect(page).to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
        find('#modal2').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).to have_css '#modal3'
        find('#modal3').click
        expect(page).not_to have_css '#modal1'
        expect(page).not_to have_css '#modal2'
        expect(page).not_to have_css '#modal3'
      end
    end
  end
end