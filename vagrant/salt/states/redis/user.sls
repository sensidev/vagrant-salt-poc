redis_user:
    user.present:
        - name: redis
        - system: true
        - createhome: false
        
