module API
  module V1
    class Reports < Grape::API
      include API::V1::Defaults
      
      resource :reports do
       
        desc "Return all reports"
        get "", root: :reports do
          { reports: Report.all }
        end

        desc "Return an abduction report"
        params do
          requires :id, type: Integer, desc: "ID of the report"
        end
        get ":id", root: "report" do
         Report.find(params[:id])
        end

        desc "Report an abduction"
        params do
          requires :reporter_id, type: Integer, desc: "ID of the reporter"
          requires :reported_id, type: Integer, desc: "ID of the reported"
        end

        post "", root: "report" do     
         { report: Report.create(reported_id: permitted_params[:reported_id], reporter_id: permitted_params[:reporter_id]) }  
          end             
      end
    end
  end
end


