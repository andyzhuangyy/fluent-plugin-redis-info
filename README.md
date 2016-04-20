# fluent-plugin-redis-info

## Installation
copy plugin into /etc/td-agent/plugins directory

reference: <http://docs.fluentd.org/articles/plugin-development#installing-custom-plugins>

    $ git clone git@github.com:andyzhuangyy/fluent-plugin-redis-info.git
    $ sudo cp fluent-plugin-redis-info/lib/fluent/plugin/in_redis_info.rb /etc/td-agent/plugins

## Configuration
```config
<source>
  type redis_info
  host [Redis Hostname]
  port [Redis Port (default: 6379)]
  interval [Redis Command interval (default:10)]
  command all
  tag redis.info
</source>
```

### output
```
2016-04-20 04:02:55 -0400 redis.info.16379: {"redis_version":"3.0.1","redis_git_sha1":0,"redis_git_dirty":0,"redis_build_id":"4bb4d2086b534dd4","redis_mode":"standalone","os":"Linux 2.6.32-042stab105.14 x86_64","arch_bits":64,"multiplexing_api":"epoll","gcc_version":"4.4.7","process_id":1250,"run_id":"ce708ea87c3642c746360e9ef0695e61bf2146bb","tcp_port":16379,"uptime_in_seconds":13306906,"uptime_in_days":154,"hz":10,"lru_clock":1521583,"config_file":"/home/y/var/LocationService/config/redis/redis1.conf","connected_clients":125,"client_longest_output_list":0,"client_biggest_input_buf":0,"blocked_clients":0,"used_memory":6780240,"used_memory_human":"6.47M","used_memory_rss":4280320,"used_memory_peak":11014272,"used_memory_peak_human":"10.50M","used_memory_lua":55296,"mem_fragmentation_ratio":0.63,"mem_allocator":"jemalloc-3.6.0","loading":0,"rdb_changes_since_last_save":9639477,"rdb_bgsave_in_progress":0,"rdb_last_save_time":1447832469,"rdb_last_bgsave_status":"ok","rdb_last_bgsave_time_sec":-1,"rdb_current_bgsave_time_sec":-1,"aof_enabled":0,"aof_rewrite_in_progress":0,"aof_rewrite_scheduled":0,"aof_last_rewrite_time_sec":-1,"aof_current_rewrite_time_sec":-1,"aof_last_bgrewrite_status":"ok","aof_last_write_status":"ok","total_connections_received":9174991,"total_commands_processed":495994895,"instantaneous_ops_per_sec":290,"total_net_input_bytes":27349371716,"total_net_output_bytes":14593925613,"instantaneous_input_kbps":19.12,"instantaneous_output_kbps":5.1,"rejected_connections":0,"sync_full":0,"sync_partial_ok":0,"sync_partial_err":0,"expired_keys":0,"evicted_keys":0,"keyspace_hits":102507245,"keyspace_misses":430603588,"pubsub_channels":0,"pubsub_patterns":0,"latest_fork_usec":0,"migrate_cached_sockets":0,"role":"master","connected_slaves":0,"master_repl_offset":0,"repl_backlog_active":0,"repl_backlog_size":1048576,"repl_backlog_first_byte_offset":0,"repl_backlog_histlen":0,"used_cpu_sys":31377.46,"used_cpu_user":20363.82,"used_cpu_sys_children":0.0,"used_cpu_user_children":0.0,"cmdstat_get":{"calls":3404239,"usec":15020189,"usec_per_call":4.41},"cmdstat_set":{"calls":9377774,"usec":72553117,"usec_per_call":7.74},"cmdstat_del":{"calls":26220,"usec":127472,"usec_per_call":4.86},"cmdstat_mget":{"calls":77172204,"usec":580493789,"usec_per_call":7.52},"cmdstat_zadd":{"calls":6060773,"usec":124603293,"usec_per_call":20.56},"cmdstat_zrem":{"calls":26210,"usec":269052,"usec_per_call":10.27},"cmdstat_zrange":{"calls":793115,"usec":9654644,"usec_per_call":12.17},"cmdstat_zrangebyscore":{"calls":104071790,"usec":795111012,"usec_per_call":7.64},"cmdstat_zcount":{"calls":2086,"usec":39328,"usec_per_call":18.85},"cmdstat_select":{"calls":238300520,"usec":1320087018,"usec_per_call":5.54},"cmdstat_keys":{"calls":127077,"usec":142720467,"usec_per_call":1123.1},"cmdstat_dbsize":{"calls":20191005,"usec":75011230,"usec_per_call":3.72},"cmdstat_ping":{"calls":33108374,"usec":88828054,"usec_per_call":2.68},"cmdstat_flushdb":{"calls":6,"usec":8470,"usec_per_call":1411.67},"cmdstat_info":{"calls":401,"usec":150584,"usec_per_call":375.52},"cmdstat_eval":{"calls":3316952,"usec":579736879,"usec_per_call":174.78},"cmdstat_slowlog":{"calls":16145,"usec":10714900,"usec_per_call":663.67},"cmdstat_latency":{"calls":4,"usec":6884,"usec_per_call":1721.0},"cluster_enabled":0,"db1":{"keys":4461,"expires":0,"avg_ttl":0},"db2":{"keys":1,"expires":0,"avg_ttl":0},"db5":{"keys":1,"expires":0,"avg_ttl":0},"db6":{"keys":17,"expires":0,"avg_ttl":0}}
```
