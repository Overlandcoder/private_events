class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = current_user.invitations.build(invitation_params)

    if @invitation.save!
      redirect_to :back,
      notice: "You've been added to this event's list of attendees."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def invitation_params
    params.require(:invitations).permit(:attendee_id, :created_event_id)
  end
end
