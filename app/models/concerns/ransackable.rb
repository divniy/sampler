module Ransackable
  extend ActiveSupport::Concern

  class_methods do
    # `ransackable_attributes` returns searchable column names
    # and any defined ransackers as an array of strings.
    #
    def ransackable_attributes(auth_object = nil)
      column_names + _ransackers.keys
    end

    # `ransackable_associations` returns the names
    # of searchable associations as an array of strings.
    #
    def ransackable_associations(auth_object = nil)
      [] # %w[author]
    end

    # `ransortable_attributes` by default returns the names
    # of all attributes available for sorting as an array of strings.
    #
    def ransortable_attributes(auth_object = nil)
      ransackable_attributes(auth_object)
    end

    # `ransackable_scopes` by default returns an empty array
    # i.e. no class methods/scopes are authorized.
    # For overriding with an allowlist, return an array of *symbols*.
    #
    def ransackable_scopes(auth_object = nil)
      []
    end
  end
end
