# frozen_string_literal: true

class Team
  def initialize(name)
    @name = name
    @matches_played = @wins = @ties = @losses = @points = 0
  end

  def won
    @matches_played += 1
    @wins += 1
    @points += 3
  end

  def drawn
    @matches_played += 1
    @ties += 1
    @points += 1
  end

  def lost
    @matches_played += 1
    @losses += 1
  end

  def to_s
    "%-30s | %2d | %2d | %2d | %2d | %2d" %
      [@name, @matches_played, @wins, @ties, @losses, @points]
  end

  include Comparable

  def <=>(other)
    points_cmp = -points <=> -other.points
    if points_cmp.zero?
      name <=> other.name
    else
      points_cmp
    end
  end

  protected

  attr_reader :name, :points, :matches_played, :wins, :ties, :losses
end

class Match
  def initialize(team1, team2, result)
    @team1 = team1
    @team2 = team2
    @result = result
  end

  def update
    case @result
    when "win"
      @team1.won
      @team2.lost
    when "loss"
      @team1.lost
      @team2.won
    when "draw"
      @team1.drawn
      @team2.drawn
    end
  end
end

class Tournament
  class << self
    def tally(input)
      header = "Team                           | MP |  W |  D |  L |  P"
      teams = parse(input)
      teams.map(&:to_s).
        unshift(header).
        join("\n") + "\n"
    end

    def parse(lines)
      roster = Hash.new { |h,name| h[name] = Team.new(name) }
      lines.split("\n").each do |line|
        team1name, team2name, result = line.split(";")
        Match.
          new(roster[team1name], roster[team2name], result).
          update
      end
      roster.values.sort
    end
  end
end

