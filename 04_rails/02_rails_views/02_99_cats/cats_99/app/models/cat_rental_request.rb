# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#

class CatRentalRequest < ApplicationRecord
  default_scope { order(start_date: :asc)}

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED),
    message: 'status must be either PENDING, APPROVED or DENIED'
  }
  validate :does_not_overlap_approved_requests

  belongs_to(
    :cat,
    class_name: 'Cat',
    foreign_key: :cat_id,
    primary_key: :id
  )

  def valid_dates?
    if start_date >= end_date
      errors[:id] << 'No time travel'
    end
  end

  def overlapping_requests
      CatRentalRequest.where(start_date: (start_date..end_date)).or(CatRentalRequest.where(end_date: (start_date..end_date))).where(cat_id: cat_id).where.not(id: id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_requests
    if overlapping_approved_requests.exists?
      errors[:request] << 'cannot overlap previously approved request!'
    else
      true
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def approve!
    if does_not_overlap_approved_requests
      ActiveRecord::Base.transaction do 
        deny_overlapping_requests
        self.status = 'APPROVED'
        self.save!
      end
    end
  end

  def deny_overlapping_requests
    overlapping_pending_requests.each do |request|
      request.status = 'DENIED'
      request.save!
    end
  end

  def deny!
    if pending?
      self.status = 'DENIED'
      self.save!
    end
  end

  def pending?
    self.status == 'PENDING' ? true : false
  end
end
