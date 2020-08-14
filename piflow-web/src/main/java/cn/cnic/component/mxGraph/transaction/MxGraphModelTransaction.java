package cn.cnic.component.mxGraph.transaction;

import cn.cnic.base.util.LoggerUtil;
import cn.cnic.component.mxGraph.entity.MxCell;
import cn.cnic.component.mxGraph.entity.MxGeometry;
import cn.cnic.component.mxGraph.entity.MxGraphModel;
import cn.cnic.component.mxGraph.mapper.MxCellMapper;
import cn.cnic.component.mxGraph.mapper.MxGeometryMapper;
import cn.cnic.component.mxGraph.mapper.MxGraphModelMapper;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Component
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout = 36000, rollbackFor = Exception.class)
public class MxGraphModelTransaction {

    /**
     * Introducing logs, note that they are all packaged under "org.slf4j"
     */
    Logger logger = LoggerUtil.getLogger();

    @Resource
    private MxGraphModelMapper mxGraphModelMapper;

    @Resource
    private MxCellMapper mxCellMapper;

    @Resource
    private MxGeometryMapper mxGeometryMapper;


    /**
     * Add process of things
     *
     * @param mxGraphModel mxGraphModel
     * @return affected rows
     */
    public int addMxGraphModel(MxGraphModel mxGraphModel) throws Exception {
        int influenceCounts = 0;
        if (null != mxGraphModel) {
            int addMxGraphModelCounts = mxGraphModelMapper.addMxGraphModel(mxGraphModel);
            if (addMxGraphModelCounts <= 0) {
                throw new Exception("save failed");
            }
            // save path
            // Number of save Paths
            int addMxCellCounts = 0;
            int addMxGeometryCounts = 0;
            List<MxCell> mxCellList = mxGraphModel.getRoot();
            if (null != mxCellList && mxCellList.size() > 0) {
                for (MxCell mxCell : mxCellList) {
                    int addMxCell = mxCellMapper.addMxCell(mxCell);
                    if (addMxCell <= 0) {
                        throw new Exception("save failed");
                    }
                    addMxCellCounts += addMxCell;
                    MxGeometry mxGeometry = mxCell.getMxGeometry();
                    if (null == mxGeometry) {
                        continue;
                    }
                    mxGeometry.setMxCell(mxCell);
                    int addMxGeometry = mxGeometryMapper.addMxGeometry(mxGeometry);
                    if (addMxGeometry <= 0) {
                        throw new Exception("save failed");
                    }
                    addMxGeometryCounts += addMxGeometry;
                }
            }
            influenceCounts = (addMxGraphModelCounts + addMxCellCounts + addMxGeometryCounts);
        }
        return influenceCounts;
    }

}
