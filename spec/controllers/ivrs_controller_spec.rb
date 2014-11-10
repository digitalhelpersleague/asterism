require 'rails_helper'

RSpec.describe IvrsController, :type => :controller do

  let(:valid_session) { {} }
  let(:json_response) { { format: 'json' } }

  describe "GET index" do
    render_views

    it "assigns all ivrs as @ivrs" do
      ivr = create(:ivr)
      get :index, json_response
      expect(assigns(:ivrs)).to eq([ivr])
    end
  end

  describe "GET show" do
    render_views

    it "assigns the requested ivr as @ivr" do
      ivr = create(:ivr)
      get :show, json_response.merge(id: ivr.id)
      expect(assigns(:ivr)).to eq(ivr)
    end
  end

  describe "POST create" do
    render_views

    describe "with valid params" do
      it "creates a new Ivr" do
        expect {
          post :create, json_response.merge({ivr: attributes_for(:ivr)})
        }.to change(Ivr, :count).by(1)
      end

      it "assigns a newly created ivr as @ivr" do
        post :create, json_response.merge({ivr: attributes_for(:ivr)})
        expect(assigns(:ivr)).to be_a(Ivr)
        expect(assigns(:ivr)).to be_persisted
      end

      it "responds with newly created ivr" do
        post :create, json_response.merge({ivr: attributes_for(:ivr)})
        expect(assigns(:ivr)).to eq(Ivr.last)
      end
    end
  end

  describe "PUT update" do
    render_views

    describe "with valid params" do
      it "updates the requested ivr" do
        ivr = create(:ivr)
        new_context = 'I0666'
        put :update, json_response.merge({id: ivr.id, ivr: { context: new_context }})
        expect change{ ivr.reload.context }.to new_context
      end

      it "assigns the requested ivr as @ivr" do
        ivr = create(:ivr)
        ivr.context = 'I0666'
        put :update, json_response.merge({id: ivr.id, ivr: ivr.to_hash})
        expect(assigns(:ivr)).to eq(ivr)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ivr" do
      ivr = create(:ivr)
      expect {
        delete :destroy, json_response.merge({id: ivr.id})
      }.to change(Ivr, :count).by(-1)
    end
  end


end
