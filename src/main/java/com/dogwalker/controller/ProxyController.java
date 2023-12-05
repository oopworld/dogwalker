package com.dogwalker.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ProxyController {
		
		private RestTemplate restTemplate=null;

	    @PostMapping("/proxy/geo")
	    public ResponseEntity<String> proxyApiCall(@RequestParam String address) {
	        HttpHeaders headers = new HttpHeaders();
	        restTemplate = new RestTemplate();
	        System.out.println(address);
	        
	        HttpEntity<String> requestEntity = new HttpEntity<>(headers);

	        ResponseEntity<String> response = restTemplate.exchange(
	            "http://api.vworld.kr/req/address?service=address&request=getcoord&version=2.0&crs=epsg:4326&address="+address+"&refine=true&simple=false&format=json&type=road&key=27EAD36A-1EE2-328F-987D-A21B40B94623",
	            HttpMethod.GET,
	            requestEntity,
	            String.class
	        );
	        
	        
	        return response;
	    }
	}

