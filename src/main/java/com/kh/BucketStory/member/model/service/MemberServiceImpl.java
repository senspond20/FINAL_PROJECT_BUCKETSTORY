package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.member.model.dao.MemberDAO;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int bucketInsert(Media m, BucketList bL) {
		return mDAO.bucketInsert(sqlSession, m, bL);
	}

	@Override
	public ArrayList<MemberMyBucketList> myBucketList(String nickName) {
		return mDAO.myBucketList(sqlSession, nickName);
	}

	@Override
	public int blogInsert(Board board) {
		return mDAO.blogInsert(sqlSession, board);
	}

	@Override
	public int getListCount(String userId) {
		return mDAO.getListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<MemberMyBucketList> myBucketListPage(String nickName, PageInfo pi) {
		return mDAO.myBucketListPage(sqlSession, nickName, pi);
	}

	@Override
	public ArrayList<Board> getBoard(String nickName, int bn) {
		String userid = mDAO.getUserId(sqlSession, nickName);
		return mDAO.getBoard(sqlSession, userid, bn);
	}

	@Override
	public Member getMember(String nickName) {
		return mDAO.getMEmber(sqlSession, nickName);
	}

}
