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

    // let date = new Date();
    // let currentDate =
    //                   date.getMonth().toString()    + '-' +
    //                   date.getDay().toString()      + '-' +
    //                   date.getFullYear().toString() + '-' +
    //                   date.getHours().toString()    +
    //                   date.getMinutes().toString()  +
    //                   date.getMinutes().toString()  + '-' +
    //                   date.getSeconds().toString();

    gulp.src([
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

        //dga tables
        'tables/dga_quarterly_earning.sql',
        'tables/dga_quarterly_earning_item.sql',
        'tables/dga_weekly_work.sql',
        'tables/dga_weekly_work_item.sql',
        'tables/dga_director_deal_memo.sql',
        'tables/dga_employment_data.sql',

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

        //dga views
        'views/dga_quarterly_earning_get_list.sql',
        'views/dga_quarterly_earning_item_get_list.sql',
        'views/dga_weekly_work_get_list.sql',
        'views/dga_weekly_work_item_get_list.sql',
        'views/dga_director_deal_memo_get_list.sql',
        'views/dga_employment_data_get_list.sql',

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