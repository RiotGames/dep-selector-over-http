#
# Author:: Christopher Walters (<cw@opscode.com>)
# Author:: Mark Anderson (<mark@opscode.com>)
# Copyright:: Copyright (c) 2010-2011 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'dep_selector/dependency_graph'
require 'dep_selector/exceptions'
require 'dep_selector/error_reporter'
require 'dep_selector/error_reporter/simple_tree_traverser'

# A Selector contains the a DependencyGraph, which is populated with
# the dependency relationships, and an array of solution
# constraints. When a solution is asked for (via #find_solution),
# either a valid assignment is returned or the first solution
# constraint that makes a solution impossible.
module DepSelector
  class Selector
    attr_accessor :dep_graph, :error_reporter

    DEFAULT_ERROR_REPORTER = ErrorReporter::SimpleTreeTraverser.new

    def initialize(dep_graph, error_reporter = DEFAULT_ERROR_REPORTER)
      @dep_graph = dep_graph
      @error_reporter = error_reporter
    end

    def find_solution(solution_constraints, valid_packages = nil)
      result = Net::HTTP.post_form(URI('http://devmerlin:9292/'), {selector: self.to_yaml, solution_constraints: solution_constraints.to_yaml, valid_packages: valid_packages.to_yaml})
      JSON.parse(result.body)
    end
  end
end
