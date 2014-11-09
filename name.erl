-module({{NAME}}).
-behaviour(gen_fsm).

-export([
	 start_link/0
	]).

-export([
	 initial_state/3,
	 initial_state/4
	]).

-export([
	 init/1,
	 handle_event/3,
	 handle_sync_event/4,
	 handle_info/2,
	 terminate/2,
	 code_change/3
	]).

start_link() ->
  Args = [],
  gen_fsm:start_link({local, ?MODULE}, ?MODULE, Args, []).

%% Callback implementation
init(_Args) ->
  StateData = {},
  {ok, inital_state, StateData}.

handle_event(_Event, StateName, StateData) ->
  {next_state, StateName, StateData}.

handle_sync_event(_Event, _From, StateName, StateData) ->
  Reply = ok,
  {next_state, Reply, StateName, StateData}.

handle_info(_Info, SateName, StateData) ->
  {next_state, StateName, StateDate}.

terminate(_Reason, _StateName, _StateDate) ->
  ok.

code_change(_OldVersion, StateName, StateData, _Extra) ->
  {ok, StateName, StateData}.

%% State functions

initial_state(_Event, StateData) ->
  {next_state, initial_state, StateData}.

initial_state(_Event, _From, StateData) ->
  Reply = ok,
  {next_state, Reply, initial_state, StateData}.
