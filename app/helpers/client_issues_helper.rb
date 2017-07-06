module ClientIssuesHelper
  def issue_ui_path(issue)
    show_by_uu_id_client_issues_path(uu_id: issue.uu_id)
  end
end
