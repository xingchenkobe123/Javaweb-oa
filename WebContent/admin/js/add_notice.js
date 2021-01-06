var app=angular.module("app",[])//定义控制程序，用ng-app指令引用
    app.controller("MainCtrl",[function(){//定义控制器，用ng-controller指令引用

        //定义属性context
        this.context="";

       this.check_submit_cursor=function(){

            if( this.context.length>140||this.context.length==0){
                return {
                    'cursor':'not-allowed'
                }
            }else{
                return {
                    'cursor':'pointer'
                }
            }
       }

        this.check_reset_cursor=function(){

            if(this.context.length==0){
                return {
                    'cursor':'not-allowed'
                }
            }else{
                return {
                    'cursor':'pointer'
                }
            }
       }

        //定义函数warn()
        this.warn=function(){
            this.color=this.context.length>140?"red":"white";
            return {
                "color":this.color
            };
        }
        //定义函数reset()
        this.reset=function(){
            this.context="";
        }
    }])
