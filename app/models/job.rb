class Job < ActiveRecord::Base
  belongs_to :processable, :polymorphic => true
  
  def self.next
    next_job = find(:first, :conditions=> ["status IS NULL"])
    if next_job
      next_job.mark_in_process!
    end
    next_job
  end
  
  def mark_in_process!
    self.status = "in_process"
    self.processed_at = Time.now
    self.save!
  end
  
  def process!
    begin
      self.processable.process!
    rescue Exception => e
      self.status = 'failure'
      self.status_description = "#{e.message} - #{e.backtrace.join("\n")}"
    else
      self.status = 'processed'
    ensure
      self.completed_at = Time.now
      self.save!
    end
  end
end
