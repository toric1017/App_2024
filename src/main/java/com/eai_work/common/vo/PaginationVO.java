package com.eai_work.common.vo;

public class PaginationVO {

	private int page = 1;					// 현재 페이지 번호
    private int recordSize = 15;			// 페이지당 출력할 데이터 개수
    private int pageButtons = 5;			// 한 화면에 보여줄 페이지 버튼수
    private int pageButtonStart;			// 페이지 버튼 시작숫자
    private int pageButtonEnd;				// 페이지 버튼 끝숫자
	private int totalPage = 1;         		// 전체 페이지 수
    private int totalCount = 0;		   		// 전체 데이터 수
    private boolean isPrevPage = false;		// 이전페이지 존재여부
	private boolean isNextPage = false;		// 다음페이지 존재여부
    
    public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		setTotalPage();
		setIsPrevPage();
		setIsNextPage();
		setPageButtonStart();
		setPageButtonEnd();
	}

	public int getPageButtonStart() {
		return pageButtonStart;
	}

	public void setPageButtonStart() {
		this.pageButtonStart = (int) Math.ceil( ( page - 1 ) / pageButtons ) * pageButtons + 1 ;
	}

	public int getPageButtonEnd() {
		return pageButtonEnd;
	}
	
	// 예상: 10
	// 6 + 5 - 1 = 10 ( totalPage > 10 일경우 )
	// 9 + 1 = 10

	public void setPageButtonEnd() {
		if(pageButtonStart + pageButtons - 1 < totalPage) {
			this.pageButtonEnd = pageButtonStart + pageButtons - 1;
		}else {
			this.pageButtonEnd = totalPage;
		}
	}

	public boolean getIsPrevPage() {
		return isPrevPage;
	}

	public void setIsPrevPage() {
		if(page > 1) this.isPrevPage = true;
		else this.isPrevPage = false;
	}

	public boolean getIsNextPage() {
		return isNextPage;
	}

	public void setIsNextPage() {
		if(page > totalPage -1) this.isNextPage = false;
		else this.isNextPage = true;
	}

    public int getPageButtons() {
		return pageButtons;
	}

	public void setPageButtons(int pageButtons) {
		this.pageButtons = pageButtons;
	}
	
    public int getOffset() {
        return (page - 1) * recordSize;
    }

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRecordSize() {
		return recordSize;
	}

	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage() {
		this.totalPage = (int) Math.ceil( Double.valueOf( totalCount ) / Double.valueOf( recordSize ) );
	}
	
	public static void main(String[] args) {
		System.out.println( (int) Math.ceil( Double.valueOf(16) / Double.valueOf(15) ) );
	}
	
}
