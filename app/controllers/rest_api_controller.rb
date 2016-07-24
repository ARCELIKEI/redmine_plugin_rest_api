class RestApiController < ApplicationController
  unloadable

  def enumarations_api
    
    @enums = Enumeration.where(type: params['type'].classify)
    if @enums
      @enumerations = @enums.shared.order("position ASC").all
      respond_to do |format|
        format.xml  do render xml: @enumerations  end
        format.json do render json: @enumerations end
        format.html do render_404 end
      end
    else 
      render_404
    end
  
  end

  def custom_fields_api
    @custom_fields = CustomField.group(:type)
    if @custom_fields
      respond_to do |format|
          format.xml  do render xml: @custom_fields  end
          format.json do render json: @custom_fields end
          format.html do render_404 end
      end
    else
      render_404
    end
  end

  def issue_history_api
    @issue_json = Issue.find(params[:id]).to_json(:include => { :journals => {:include => {:details => { :except => [:id, :journal_id]}}, :except => [:id, :journalized_id, :journalized_type]}})
    @issue_xml = Issue.find(params[:id]).to_xml(:include => { :journals => {:include => {:details => { :except => [:id, :journal_id]}}, :except => [:id, :journalized_id, :journalized_type]}})

    if @issue_xml || @issue_json
        respond_to do |format|
            format.xml  do render xml: @issue_xml  end
            format.json do render json: @issue_json end
            format.html do render_404 end
        end
    else
      render_404
    end

  end



end
