package jp.co.se.android.androidbook2.chapter0417;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.provider.CalendarContract;
import android.provider.CalendarContract.Events;
import android.app.Activity;
import android.content.ContentUris;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.Cursor;
import android.graphics.Color;
import android.util.Log;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.GridLayout;
import android.widget.GridLayout.LayoutParams;
import android.widget.TextView;
import android.support.v4.app.NavUtils;

public class MainActivity extends Activity implements OnClickListener {
    // ログ出力時のタグ
    private final String TAG = "Chapter0417";
    // カレンダーを表示するGridLayout
    private GridLayout mGridLayout1;
    // 当月に対する表示月の位置
    private int mPosition = 0;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // 画面のインスタンスを取得
        mGridLayout1 = (GridLayout) findViewById(R.id.gridLayout1);
        
        SharedPreferences shared = PreferenceManager.getDefaultSharedPreferences(this);
        mPosition = shared.getInt("key.position",0);
        
        findViewById(R.id.button1).setOnClickListener(new OnClickListener(){
        	public void onClick(View v){
        		mPosition--;
        		buildCalendar();
        	}
        });
        findViewById(R.id.button2).setOnClickListener(new OnClickListener() {
        	public void onClick(View v){
        		mPosition++;
        		buildCalendar();
        	}
        });
        buildCalendar();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }

    @Override
    protected void onPause() {
        super.onPause();
        SharedPreferences shared = PreferenceManager.getDefaultSharedPreferences(this);
        Editor editor = shared.edit();
        editor.putInt("key.position", mPosition);
        editor.commit();
    }

    @Override
    public void onClick(View v) {
    	List<CalendarEvent> event = (List<CalendarEvent>) v.getTag();
    	if(event != null && event.size() > 0){
    		Uri uri = ContentUris.withAppendedId(Events.CONTENT_URI, event.get(0).getId());
    		
    		Intent intent = new Intent(Intent.ACTION_VIEW).setData(uri).putExtra(Events.TITLE, event.get(0).getTitle());
    		
    		startActivity(intent);
    	}
    }
    public void setTitle(Calendar calendar){
    	SimpleDateFormat sdf= new SimpleDateFormat("yyyy/MM");
    	TextView textView1 = (TextView) findViewById(R.id.textView1 );
    	textView1.setText(sdf.format(calendar.getTime()));
    }
    public void buildCalendar(){
    	Calendar current = Calendar.getInstance();
    	current.add(Calendar.MONTH, mPosition);
    	current.set(Calendar.DAY_OF_MONTH, 1);
    	
    	setTitle(current);
    	
    	mGridLayout1.removeAllViews();
    	
    	addDayOfWeek();
    	
    	addDayOfMonth(current);
    }
    private void addDayOfWeek(){
    	String[] weeks = getResources().getStringArray(R.array.week_names);
    	for(int i = 0; i<weeks.length; i++){
    		View child = getLayoutInflater().inflate(R.layout.calendar_week, null);
    		
    		TextView textView1 = (TextView) child.findViewById(R.id.textView1);
    		
    		textView1.setText(weeks[i]);
    		
    		textView1.setTextColor(i == 0 ? Color.RED : Color.BLACK);
    		
    		GridLayout.LayoutParams params = new GridLayout.LayoutParams();
    		params.setGravity(Gravity.FILL_HORIZONTAL);
    		mGridLayout1.addView(child);
    	}
    }
    private void addDayOfMonth(Calendar calendar){
    	int maxdate = calendar.getMaximum(Calendar.DAY_OF_MONTH);
    	
    	for(int i = 0; i< maxdate; i++){
    		View child = getLayoutInflater().inflate(R.layout.calendar_date, null);
    		
    		TextView textView1 = (TextView) child.findViewById(R.id.textView1);
    		TextView textView2 = (TextView) child.findViewById(R.id.textView2);
    		TextView textView3 = (TextView) child.findViewById(R.id.textView3);
    		
    		int week = calendar.get(Calendar.DAY_OF_WEEK);
    		
    		child.setOnClickListener(this);
    		
    		textView1.setText(Integer.toString(i +1));
    		
    		textView1.setTextColor(week == Calendar.SUNDAY ? Color.RED : Color.BLACK);
    		
    		List<CalendarEvent> events = queryEvent(calendar);
    		if(events != null && events.size() >0){
    			textView2.setText(events.get(0).getTitle());
    			
    			if(events.size() >1){
    				textView3.setVisibility(View.VISIBLE);
    			}
    			child.setTag(events);
    		}
    		else{
    			textView2.setText("");
    			textView3.setVisibility(View.GONE);
    		}
    		GridLayout.LayoutParams params = new GridLayout.LayoutParams();
    		if(i ==0){
    			params.rowSpec = GridLayout.spec(1);
    			params.columnSpec = GridLayout.spec(week - Calendar.SUNDAY);
    		}
    		params.setGravity(Gravity.FILL_HORIZONTAL);
    		mGridLayout1.addView(child,params);
    		
    		calendar.add(Calendar.DAY_OF_MONTH, 1);
    		
    	}
    }
    
    private List<CalendarEvent> queryEvent(Calendar calendar){
    	List<CalendarEvent> result =new ArrayList<CalendarEvent>();
    	
    	String[] projection = new String[]{
    		CalendarContract.Instances.EVENT_ID,CalendarContract.Instances.TITLE,CalendarContract.Instances.BEGIN,CalendarContract.Instances.END	
    	};
    	
    	Calendar beginTime =(Calendar) calendar.clone();
    	beginTime.set(Calendar.HOUR_OF_DAY, 0);
    	beginTime.set(Calendar.MINUTE, 0);
    	beginTime.set(Calendar.SECOND, 0);
    	
    	Calendar endTime = (Calendar) beginTime.clone();
    	endTime.add(Calendar.DAY_OF_MONTH, 1);
    	
    	Uri.Builder builder = CalendarContract.Instances.CONTENT_URI.buildUpon();
    	ContentUris.appendId(builder, beginTime.getTimeInMillis());
    	ContentUris.appendId(builder, endTime.getTimeInMillis());
    	
    	Log.d(TAG,new Date(beginTime.getTimeInMillis()) +"," + new Date (endTime.getTimeInMillis()) + ":retrive");
    	
    	Cursor cursor = getContentResolver().query(builder.build(), projection, null, null, null);
    	
    	try{
    		if(cursor.moveToFirst()){
    			do{
    				CalendarEvent event = new CalendarEvent(cursor.getLong(0));
    				
    				event.setTitle(cursor.getString(1));
    				long start = cursor.getLong(2);
    				long end = cursor.getLong(3);
    				Log.d(TAG,new Date(start) + "," + new Date(end) + ":query" + event.getId() +":" + event.getTitle());
    				result.add(event);
    			}while(cursor.moveToNext());
    		}
    	}finally{
    		if(cursor != null){
    			cursor.close();
    		}
    	}
    	return result;
    }
}
