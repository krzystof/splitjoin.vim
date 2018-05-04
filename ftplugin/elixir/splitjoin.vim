let b:splitjoin_split_callbacks = [
      \ 'sj#elixir#SplitDef',
      \ 'sj#elixir#SplitList',
      \ 'sj#elixir#SplitPipe'
      \ ]

let b:splitjoin_join_callbacks = [
      \ 'sj#elixir#JoinDef',
      \ 'sj#elixir#JoinList',
      \ 'sj#elixir#JoinPipe',
      \ ]
