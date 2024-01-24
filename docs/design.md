# 设计文档

## 概述

在这个设计文档中，我们将讨论鸿蒙应用开发的设计和架构

## 目录

1. [命名规范]
2. [工程结构]
3. [应用架构]

## 1. 命名规范

* 目录命名有复数形式，应优先使用复数形式，例如：`modules`、`routes`、`services`。

* 文件命名应采用大驼峰命名法，例如：`XxxXxx`。

* 类命名应采用大驼峰命名法，例如：`XxxXxx.ets`。

## 2. 工程结构
* ets 存放代码文件
  * data 数据层
    * enums 负责定义业务枚举类型
    * models 负责定义业务模型
      * remote 负责定义远程模型
      * local 负责定义本地模型
      * view 负责定义视图模型
    * repositories 负责封装业务数据处理逻辑
    * sources 负责定义数据源
        * remote 负责定义远程数据源
        * local 负责定义本地数据源
    * errors 负责封装业务错误处理逻辑
  * pages 业务模块层
    * xxx 模块
      * XxxPage.ets/XxxView.ets 模块视图
      * XxxController.ets 模块控制器
  * components 组件层（可通用的组件，适合在多个模块复用）
    * xxx 组件
      * Xxx.ets 组件视图
      * XxxController.ets 组件控制器
  * routes 路由层
  * tracking 数据采集层
  * services 服务层
* resources 存放资源文件
  * base 基础资源
    * element 
      * color.json 负责定义颜色
      * float.json 负责定义尺寸
      * string.json 负责定义文本
    * media 负责定义媒体资源
    * profile 负责定义配置文件
      * main_pages.json 负责定义页面路径
  * zh_CN 负责定义中文资源
    * element
      * string.json 负责定义文本
  * en_US 负责定义英文资源
    * element
      * string.json 负责定义文本