#!/bin/bash
# Supabase SQL Upload Script
# 通过Management API上传SQL文件到Supabase

PROJECT_REF="wdpeoyugsxqnpwwtkqsl"
ACCESS_TOKEN="sbp_5cb28319a97e93145a27596aea05a89a226d2014"
API_URL="https://api.supabase.com/v1/projects/${PROJECT_REF}/database/query"

execute_sql() {
    local sql="$1"
    # 转义JSON特殊字符
    local escaped_sql=$(echo "$sql" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))')

    response=$(curl -s -X POST "$API_URL" \
        -H "Authorization: Bearer $ACCESS_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"query\": $escaped_sql}" \
        --max-time 120)

    if echo "$response" | grep -q '"error"'; then
        echo "ERROR: $response"
        return 1
    fi
    return 0
}

upload_file() {
    local filepath="$1"
    local filename=$(basename "$filepath")

    echo ""
    echo "=================================================="
    echo "上传: $filename"
    echo "=================================================="

    if [ ! -f "$filepath" ]; then
        echo "  文件不存在: $filepath"
        return 1
    fi

    # 读取整个文件作为单个SQL块执行
    local content=$(cat "$filepath")

    echo "  执行中..."
    if execute_sql "$content"; then
        echo "  成功!"
        return 0
    else
        echo "  失败!"
        return 1
    fi
}

# 启用扩展
echo "启用PostgreSQL扩展..."
execute_sql "CREATE EXTENSION IF NOT EXISTS pgcrypto;"
execute_sql 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
execute_sql "CREATE EXTENSION IF NOT EXISTS pg_trgm;"
execute_sql "CREATE EXTENSION IF NOT EXISTS btree_gin;"

# 如果指定了文件，只执行该文件
if [ -n "$1" ]; then
    upload_file "$1"
    exit $?
fi

echo "请指定要上传的SQL文件"
