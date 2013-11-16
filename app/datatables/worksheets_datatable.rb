class WorksheetsDatatable
  delegate :params, :link_to,  to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Worksheet.count,
      #iTotalDisplayRecords: worksheets.total_entries,
      aaData: data
    }
  end

private

  def data
    worksheets.map do |worksheet|
      [
        worksheet.number,
        worksheet.sex_name,
        worksheet.age,
        worksheet.language_name,
        worksheet.specialty_name,
        worksheet.dateinput,
        worksheet.city_name,
        link_to('Показать', worksheet),
        link_to('Удалить', worksheet, method: :delete, data: { confirm: 'Вы уверены?' })
      ]
    end
  end

  def worksheets
    @worksheets ||= fetch_worksheets
  end

  def fetch_worksheets
    worksheets = Worksheet.order("#{sort_column} #{sort_direction}")
    #worksheets = worksheets.page(page).per_page(per_page)
    if params[:sSearch].present?
      worksheets = worksheets.where("number like :search or age like :search", search: "%#{params[:sSearch]}%")
    end
    worksheets
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[number sex age]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end