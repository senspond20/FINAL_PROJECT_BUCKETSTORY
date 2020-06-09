package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;

public interface MemberService{

	int bucketInsert(Media m, BucketList bL);

	ArrayList<BucketList> myBucketList(String userId);
	
	
}
