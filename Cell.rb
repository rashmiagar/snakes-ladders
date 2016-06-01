class Cell
  attr_accessor :cell_id
  attr_accessor :endpoint

  def initialize(id, endpt)
    self.cell_id = id
    self.endpoint = endpt
  end

  def get_ids
    return cell_id, endpoint
  end
end
