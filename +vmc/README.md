VMC-DevOps
│
├── +vmc                     % SDK（所有核心代码）
│   │
│   ├── Project.m            ⭐ 项目入口
│   ├── Logger.m             ⭐ 日志
│   ├── Config.m             ⭐ 配置
│   ├── Version.m            ⭐ 版本
│   │
│   ├── +import              % 导入供应商交付
│   ├── +autosar             % AUTOSAR解析
│   ├── +database            % 数据库
│   ├── +builder             % TopModel生成
│   ├── +review              % AI评审
│   ├── +report              % 文档输出
│   └── +utils               % 公共函数
│
├── supplier                 % 供应商交付
│
├── config
│
├── data
│
├── model
│
├── report
│
├── scripts
│
├── app
│
├── docs
│
└── test
