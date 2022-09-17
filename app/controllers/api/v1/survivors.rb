module API
  module V1
    class Survivors < Grape::API
      include API::V1::Defaults

      resource :survivors do
       
        desc "Return all survivors"
        get "", root: :survivors do
          { survivors: Survivor.all }
        end

        desc "Return a survivor"
        params do
          requires :id, type: String, desc: "ID of the survivor"
        end
          get ":id", root: "survivor" do
          { survivors:  Survivor.where(id: permitted_params[:id]).first! }
        end

        desc "Update survivor Location"
        params do
          requires :id, type: String, desc: "ID of the survivor"
          requires :longitude, type: String, desc: "Update longitude location"
          requires :latitude, type: String, desc: "Update latitude location"
        end
          post ":id", root: "survivor" do
            { survivors:  Survivor.where(id: permitted_params[:id]).update(longitude: permitted_params[:longitude],latitude: permitted_params[:latitude]) }
        end
      end
    end
  end
end