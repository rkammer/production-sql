var gulp   = require('gulp');
var concat = require('gulp-concat');

gulp.task('banana', function() {
    console.log("Banana ii");
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
        'tables/deal_type.sql',
        'tables/field_work.sql',
        'tables/season.sql',
        'tables/episode.sql',

        //dga tables
        'tables/dga_quarter.sql',

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
        'views/deal_type_get_list.sql',
        'views/field_work_get_list.sql',
        'views/season_get_list.sql',
        'views/episode_get_list.sql',

        //dga views
        'views/dga_quarter_get_list.sql',

        'procedures/company_set_list.sql',
        'procedures/network_set_list.sql',
        // 'procedures/state_set_list.sql',
        'procedures/production_length_set_list.sql',
        'procedures/production_type_set_list.sql',
        'procedures/production_set_list.sql',
        'procedures/production_state_set_list.sql',
        'procedures/deal_type_set_list.sql',
        'procedures/field_work_set_list.sql',
        'procedures/season_set_list.sql',
        'procedures/episode_set_list.sql',

        //dga procedures
        'procedures/dga_quarter_set_list.sql',

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