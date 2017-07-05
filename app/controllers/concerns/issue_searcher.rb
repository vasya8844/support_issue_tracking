module IssueSearcher
  # extend ActiveSupport::Concern

  def try_search_by_uu_id(issues)
    if params[:search_uu_id].present?
      issues = issues.where(uu_id: params[:search_uu_id])
      if issue = issues.first
        redirect_to issue
        return
      end
    end
    issues
  end

  def try_search_in_issues(issues)
    if params[:search_in_issue].present?
      part = "%#{params[:search_in_issue]}%"
      issues = issues.where('subject like (?) OR description like (?)', part, part)
    end
    issues
  end

  def try_search_by_author(issues)
    if params[:search_by_author].present?
      part = "%#{params[:search_by_author]}%"
      issues = issues.where('reporter_name like (?) OR reporter_email like (?)', part, part)
    end
    issues
  end
end