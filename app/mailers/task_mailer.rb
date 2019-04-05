class TaskMailer < ApplicationMailer
  default from: 'yamashiro.koo@gmail.com'

  def creation_email(task)
    @task = task
    mail(
      subject:  'タスク作成完了メール',
      to:       'niceonionslice@gmail.com'
    )
  end
end
