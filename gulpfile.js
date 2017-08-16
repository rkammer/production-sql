var gulp   = require('gulp');
var concat = require('gulp-concat');
// var mysql  = require('mysql');

gulp.task('mysql', function() {
    console.log("connecting to Mysql");
    var connection = mysql.createConnection({
        host     : 'xxxxxxxxxxxxxxx',
        user     : 'xxxxxxxxxxxxxxx',
        password : 'xxxxxxxxxxxxxxx',
        database : 'xxxxxxxxxxxxxxx',
        typeCast : false
    });

    connection.connect();

    connection.query('SELECT * FROM company', function (error, results, fields) {
        if (error) throw error;
        // console.log(fields);
        console.log('The id:   ', results[0].id);
        console.log('The name: ', results[0].name);
    });

    connection.end();

});

gulp.task('script', function(){

    gulp.src([

        // 'scripts/00-drop-objects.sql',

        'tables/state.sql',
        'tables/company.sql',
        'tables/network.sql',
        'tables/production_length.sql',
        'tables/production_type.sql',
        'tables/production.sql',
        'tables/production_state.sql',
        // 'tables/deal_type.sql',
        // 'tables/field_work.sql',
        'tables/season.sql',
        'tables/episode.sql',
        'tables/contact.sql',
        'tables/company_contact.sql',
        'tables/media_type.sql',
        'tables/period.sql',
        'tables/guild.sql',
        'tables/contact_role.sql',
        'tables/production_contact.sql',
        'tables/production_stage.sql',
        'tables/production_guild.sql',

        //dga tables
        'tables/dga_quarterly_earning.sql',
        'tables/dga_quarterly_earning_item.sql',
        'tables/dga_weekly_work.sql',
        'tables/dga_weekly_work_item.sql',
        'tables/dga_director_deal_memo.sql',
        'tables/dga_employment_data.sql',
        'tables/dga_stage_manager_deal_memo.sql',
        'tables/dga_director_scripted_deal_memo.sql',
        'tables/dga_upm_deal_memo.sql',
        'tables/dga_pif_tv.sql',
        'tables/dga_pif_tv_company.sql',


        //wga tables
        'tables/wga_work_list.sql',
        'tables/wga_deal_type.sql',
        'tables/wga_field_of_work.sql',


        //functions
        'functions/contact_get_full_name.sql',

        'views/company_get_list.sql',
        'views/company_media_get_list.sql',
        'views/company_production_get_list.sql',
        'views/company_payroll_get_list.sql',
        'views/network_get_list.sql',
        'views/state_get_list.sql',
        'views/production_length_get_list.sql',
        'views/production_type_get_list.sql',
        'views/production_get_list.sql',
        'views/production_state_get_list.sql',
        // 'views/deal_type_get_list.sql',
        // 'views/field_work_get_list.sql',
        'views/season_get_list.sql',
        'views/episode_get_list.sql',
        'views/contact_get_list.sql',
        'views/company_contact_get_list.sql',
        'views/media_type_get_list.sql',
        'views/period_get_list.sql',
        'views/guild_get_list.sql',
        'views/contact_role_get_list.sql',
        'views/production_contact_get_list.sql',
        'views/production_stage_get_list.sql',
        'views/production_guild_get_list.sql',

        //dga views
        'views/dga_quarterly_earning_get_list.sql',
        'views/dga_quarterly_earning_item_get_list.sql',
        'views/dga_weekly_work_get_list.sql',
        'views/dga_weekly_work_item_get_list.sql',
        'views/dga_director_deal_memo_get_list.sql',
        'views/dga_employment_data_get_list.sql',
        'views/dga_stage_manager_deal_memo_get_list.sql',
        'views/dga_director_scripted_deal_memo_get_list.sql',
        'views/dga_upm_deal_memo_get_list.sql',
        'views/dga_pif_tv_get_list.sql',
        'views/dga_pif_tv_company_get_list.sql',

        //wga views
        'views/wga_work_list_get_list.sql',
        'views/wga_deal_type_get_list.sql',
        'views/wga_field_of_work_get_list.sql',

        'procedures/company_set_list.sql',
        'procedures/network_set_list.sql',
        // 'procedures/state_set_list.sql',
        'procedures/production_length_set_list.sql',
        'procedures/production_type_set_list.sql',
        'procedures/production_set_list.sql',
        'procedures/production_state_set_list.sql',
        // 'procedures/deal_type_set_list.sql',
        // 'procedures/field_work_set_list.sql',
        'procedures/season_set_list.sql',
        'procedures/episode_set_list.sql',
        'procedures/contact_set_list.sql',
        'procedures/company_contact_set_list.sql',
        'procedures/guild_set_list.sql',
        'procedures/contact_set_list.sql',
        'procedures/production_contact_set_list.sql',
        'procedures/production_stage_set_list.sql',
        'procedures/production_guild_set_list.sql',

        //dga procedures
        'procedures/dga_quarterly_earning_set_list.sql',
        'procedures/dga_quarterly_earning_item_set_list.sql',
        'procedures/dga_quarterly_earning_set_closed.sql',
        'procedures/dga_weekly_work_set_list.sql',
        'procedures/dga_weekly_work_item_set_list.sql',
        'procedures/dga_weekly_work_set_closed.sql',
        'procedures/dga_director_deal_memo_set_list.sql',
        'procedures/dga_director_deal_memo_set_closed.sql',
        'procedures/dga_employment_data_set_list.sql',
        'procedures/dga_employment_data_set_closed.sql',
        'procedures/dga_stage_manager_deal_memo_set_list.sql',
        'procedures/dga_stage_manager_deal_memo_set_closed.sql',
        'procedures/dga_director_scripted_deal_memo_set_list.sql',
        'procedures/dga_director_scripted_deal_memo_set_closed.sql',
        'procedures/dga_upm_deal_memo_set_list.sql',
        'procedures/dga_upm_deal_memo_set_closed.sql',
        'procedures/dga_pif_tv_set_list.sql',
        'procedures/dga_pif_tv_company_set_list.sql',
        'procedures/dga_pif_tv_set_closed.sql',

        //wga procedures
        'procedures/wga_work_list_set_list.sql',
        'procedures/wga_work_list_set_closed.sql',

        'scripts/01-insert-data.sql'

        // 'views/*.sql',
        // 'procedures/*.sql'
        ])
    .pipe(
        concat('create-database-new.sql', {newLine: '\r\n\r\n '})
    )
    .pipe(
        gulp.dest('output')
    )
});