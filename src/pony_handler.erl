-module(pony_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).


init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
    Headers = [{<<"content-type">>, <<"text/html">>}],
    {ok, Body} = mylittlepony_dtl:render([{pony_name, "Dazzleglow"}]),
	{ok, Req2} = cowboy_req:reply(200, Headers, Body, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
