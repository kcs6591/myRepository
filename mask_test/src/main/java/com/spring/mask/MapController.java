package com.spring.mask;

import java.awt.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	// 들어오 주소기준 map.jsp 호출	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String Map(@RequestParam("addr") String search, Model model) 
	{
		logger.info("Welcome home! The client locale is {}.", search);
		
		model.addAttribute("addr", search );
		
		return "map";
	}
	
	// 마스크정보 Search (공공데이터 참조)
	@RequestMapping(value = "/map/searchMask", method = RequestMethod.GET)
	public @ResponseBody ArrayList<MaskInfo> searchMask(@RequestParam("ga") String ga, @RequestParam("ha") String ha) 
	{
		
		ArrayList<MaskInfo> list = new ArrayList<MaskInfo>();
		
		
		try {
			
			double lng = Double.parseDouble(ga);		// 위도
			double lat = Double.parseDouble(ha);		// 경도
			String strUrl = "https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat=" + lat + "&&lng=" + lng + "&&m=1000";
			
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection(); 
			con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
			con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
			//con.addRequestProperty("x-api-key", RestTestCommon.API_KEY); //key값 설정

			con.setRequestMethod("GET");
			
			con.setDoOutput(false); 
			
			StringBuilder sb = new StringBuilder();
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				//Stream을 처리해줘야 하는 귀찮음이 있음. 
				BufferedReader br = new BufferedReader(
						new InputStreamReader(con.getInputStream(), "utf-8"));
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();
				//System.out.println("" + sb.toString());
			} else {
				System.out.println(con.getResponseMessage());
			}
			
			JSONParser p = new JSONParser();			
			JSONObject obj = (JSONObject)p.parse(sb.toString());
			
			int cnt = Integer.parseInt(obj.get("count").toString());
			
			
			JSONArray storeArray = (JSONArray) obj.get("stores");
			
			
			
			for(int i=0; i<storeArray.size(); i++){
				 
                //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
                JSONObject storeInfo = (JSONObject) storeArray.get(i);
                
                MaskInfo maskInfo = new MaskInfo();
                maskInfo.setCode(storeInfo.get("code").toString());
                maskInfo.setLng(Double.parseDouble(storeInfo.get("lng").toString()));
                maskInfo.setLat(Double.parseDouble(storeInfo.get("lat").toString()));
                maskInfo.setAddr(storeInfo.get("addr").toString());
                maskInfo.setName(storeInfo.get("name").toString());
                maskInfo.setRemain_stat(storeInfo.get("remain_stat").toString());
                maskInfo.setType(storeInfo.get("type").toString());
                maskInfo.setCreated_at(storeInfo.get("created_at").toString());
                maskInfo.setStock_at(storeInfo.get("stock_at").toString());
                
                list.add(maskInfo);
            }
			
			//model.addAttribute("maskInfo", list);
			
			
		} catch (Exception e){
			System.err.println(e.toString());
		}

		
		//logger.info("Welcome home! The client locale is {}.", ga);
		
		//model.addAttribute("addr", search );
		
		
		return list;
	}
	
}
