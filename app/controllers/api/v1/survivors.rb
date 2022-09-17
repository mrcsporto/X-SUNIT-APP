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
          requires :id, type: String, desc: "ID of the 
            survivor"
        end
        get ":id", root: "survivor" do
        { survivors:  Survivor.where(id: permitted_params[:id]).first! }
        end

        desc "Report Abduction"
        params do
          requires :id, type: String, desc: "ID of the 
            survivor"
        end

        post ":id", root: "survivor" do
          { survivors:  Survivor.where(id: permitted_params[:id]).update(abducted: true) }
        end

        desc "Update survivor Location"
        params do
          requires :id, type: String, desc: "ID of the 
            survivor"
        end

        post ":id", root: "survivor" do
          { survivors:  Survivor.where(id: permitted_params[:id]).update(:latitude) }
        end

      end

    end
  end
end
